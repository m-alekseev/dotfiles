## Communication

- No greetings, summaries, or filler. Be direct and terse.

## Thinking before acting

- State assumptions explicitly before implementing. If uncertain or multiple interpretations exist, ask.
- Never invent APIs, functions, types, or behavior. To verify, in order: read the source, check docs, search the web, ask the user.
- If a simpler approach exists, say so before implementing the requested one.

## Code scope

- No comments or docstrings unless explicitly requested or critical for complex logic.
- Match existing codebase style, indentation, and naming conventions exactly.
- Do not refactor, rename, or clean up code beyond the stated task scope.
- Remove imports/variables/functions that your changes made unused; don't touch pre-existing dead code.
- No features, abstractions, or error handling beyond what was asked.

## Workflow

- Limit initial file reads to relevant context. Ask before broad scans of project source.
- Ask before applying any edits, installing dependencies, writing tests, or running git commands.
- For multi-step tasks, briefly outline steps and how each will be verified before starting.
- Before implementing, propose a brief plan and wait for confirmation. Do not run large numbers of exploratory Bash/Read commands or repeatedly say "Let me check the current state" without producing changes.
- Re-read the actual file contents before claiming a bug exists, a rename succeeded, or a config is misnamed. Do not assert the current state without verifying it.

## Editing conventions

- Make only the edits requested. Do not over-anticipate or change unrelated settings (e.g. layouts, config flags); if a broader change seems useful, ask first.
