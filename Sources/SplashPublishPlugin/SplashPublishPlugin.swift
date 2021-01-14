/**
*  Splash-plugin for Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import Publish
import Splash
import Ink

public extension Plugin {
    static func splash(withClassPrefix classPrefix: String) -> Self {
        Plugin(name: "Splash") { context in
            context.markdownParser.addModifier(
                .splashCodeBlocks(withFormat: HTMLOutputFormat(
                    classPrefix: classPrefix
                ))
            )
        }
    }
}

public extension Modifier {
    static func splashCodeBlocks(withFormat format: HTMLOutputFormat = .init()) -> Self {
        Modifier(target: .codeBlocks) { html, markdown in
            var markdown = markdown.dropFirst("```".count)

            guard !markdown.hasPrefix("no-highlight") else {
                return html
            }

            let grammar: Grammar
            let language = markdown.prefix(4)
            switch language {
            case "kotl":
                grammar = KotlinGrammar()
            default:
                grammar = SwiftGrammar()
            }

            markdown = markdown
                .drop(while: { !$0.isNewline })
                .dropFirst()
                .dropLast("\n```".count)

            let highlighted = SyntaxHighlighter(
                format: format,
                grammar: grammar
            ).highlight(String(markdown))
            return "<pre><code>" + highlighted + "\n</code></pre>"
        }
    }
}

