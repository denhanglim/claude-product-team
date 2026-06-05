# Team Context

> Fill in the sections relevant to your project. The entire product team reads this file on every
> run to understand your business, domain, and constraints. Leave sections blank or delete them
> if not applicable — agents handle missing context gracefully.
>
> This file is the single source of truth for context that would otherwise need to be
> repeated in every agent prompt. Put it here once; it flows everywhere.

---

## Project / Company Overview

<!-- What does your company or project do? What problem does it solve? Who uses it?
     2–4 sentences. Be concrete — "a platform for X that does Y for Z users" beats "a SaaS tool". -->


## Your Role

<!-- What is your role in this project? What are you responsible for building?
     This helps agents calibrate who they are helping and what level of domain knowledge to assume.
     Example: "I'm the sole developer building internal tooling for a 5-person ops team." -->


## Domain Vocabulary

<!-- Key terms your team uses. Agents will use these rather than inventing synonyms or generic alternatives.
     Add as many rows as needed. -->

| Term | Definition |
|---|---|
|  |  |

## Tech Stack

<!-- What technologies does your project use? Agents match these and do not introduce alternatives.
     Fill in only what applies. -->

- **Languages:**
- **Frameworks:**
- **Databases / storage:**
- **External APIs / integrations:**
- **Testing libraries:**
- **Package manager / build tool:**

## MCP Tools Available

<!-- List any MCP servers connected to your Claude Code session.
     Agents will use these tools for external service interactions and never hallucinate API schemas.
     Example: "Affinity CRM — mcp__claude_ai_Affinity__*" -->

- None (update this when you connect MCP servers)

## Constraints & Preferences

<!-- Non-obvious rules, coding standards, or preferences the team must follow.
     Examples:
       - "all async code must use async/await, not callbacks"
       - "no new third-party libraries without explicit approval"
       - "CLI output must stay within 80 characters"
       - "do not use ORM — raw SQL only"
-->

-

## Sensitivity Rules

<!-- What data is sensitive and how should agents handle it?
     This is the primary rulebook for security-compliance.
     Examples:
       - "customer email addresses — never log, never commit, never include in error messages"
       - "API keys — load from env only, never hardcode"
       - "user IDs — can be logged but not exported to third parties"
-->

-
