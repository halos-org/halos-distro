# Human Development Guidance - Agentic Coding with Claude Code

**Last modified:** 2025-11-16

This guide helps you leverage Claude Code effectively to develop faster while improving quality. **The key is reminding Claude to follow the workflow at the start of each task.**

## ⚠️ Reality Check: Claude Needs Reminders

While Claude can read AGENTS.md and find DEVELOPMENT_WORKFLOW.md, **it often forgets to follow the process unless explicitly reminded**. A simple reminder at the start saves pain later.

## Quick Start: Your Development Session

### 1. First, Create an Issue WITH Workflow Reminder
```
You: Create a GitHub issue for adding user authentication.
     Include a reminder to follow DEVELOPMENT_WORKFLOW.md during implementation.
```

Claude creates issue with workflow steps baked in.

### 2. Start Work WITH Process Reminder
```
You: Work on issue #42. Remember to follow DEVELOPMENT_WORKFLOW.md -
     explore first without coding, plan with "think hard", write tests first,
     then implement.
```

This reminder ensures Claude actually:
- Explores relevant code WITHOUT coding first
- Plans the approach using "think hard"
- Writes tests FIRST
- Implements until tests pass
- Commits with proper message

Without the reminder, Claude often jumps straight to coding!

### 3. It's Fine to Code Yourself
```
You: I'll write the authentication module myself, then you can add tests.
You: I'm manually editing the config file, here's what I changed...
You: I fixed the bug in auth.js, now update the tests to cover it.
```

Perfectly valid! Just tell Claude what you did so it stays in sync.

## Real-World Examples

### ✅ Starting a Feature (Right Way)
```
You: We need to add rate limiting to the API. Create an issue for this,
     making sure to include the DEVELOPMENT_WORKFLOW.md requirements.

Claude: [Creates issue #67 with workflow checklist]

You: Great, now work on issue #67, following DEVELOPMENT_WORKFLOW.md -
     explore first!

Claude: [Explores existing middleware, plans approach, writes tests, implements]
```

### ❌ Starting a Feature (Wrong Way)
```
You: Add rate limiting to the API

Claude: [Immediately starts writing code, skips tests, misses edge cases]
```

### ✅ Bug Fix (Right Way)
```
You: Users report the search returns duplicates sometimes.
     Create a bug issue and fix it following DEVELOPMENT_WORKFLOW.md,
     especially write a test that reproduces the bug first.

Claude: [Creates issue, writes failing test, then fixes bug properly]
```

### ❌ Bug Fix (Wrong Way)
```
You: Fix the duplicate search results

Claude: [Jumps to a quick fix without understanding root cause]
```

## Common Scenarios

### Starting a New Feature
```
You: Create issue for adding user notifications. Include DEVELOPMENT_WORKFLOW.md reminder.
You: Work on issue #[number], follow the workflow - explore first!
```

### Fixing a Bug
```
You: There's a crash when users input empty passwords.
     Create a bug issue and fix it following DEVELOPMENT_WORKFLOW.md -
     write a test that reproduces the bug first.
```

### Code Review Feedback
```
You: PR #55 has review comments about security. Address them.
     Follow DEVELOPMENT_WORKFLOW.md for any code changes.
```

### Refactoring
```
You: Refactor the auth module to use the new pattern we discussed.
     Remember to follow DEVELOPMENT_WORKFLOW.md - especially keeping tests passing.
```

### Mixed Human/AI Development
```
You: I'm writing the new payment module. You handle the tests and documentation.
You: I edited the database schema. Update the models to match.
```

## Power Techniques

### 1. Batch Operations
```
You: Fix all the ESLint warnings in the frontend
You: Update all API endpoints to use the new error format
You: Add logging to all database operations
```

### 2. Exploratory Questions
```
You: How does our caching work?
You: Find all places where we handle user sessions
You: What would break if we changed the User model?
```

### 3. Architecture Decisions
```
You: Should we use Redis or Memcached for sessions?
```
Claude Code will analyze trade-offs and recommend based on your codebase.

### 4. Parallel Work
```
You: Work on issues #42, #43, and #44 in parallel
```
Claude Code can handle multiple non-conflicting tasks simultaneously.

## What TO Do vs NOT to Do

### ✅ DO: Remind About the Workflow
**Good:** "Implement feature X following DEVELOPMENT_WORKFLOW.md"
**Bad:** "Implement feature X" (Claude might skip the process)

### ✅ DO: Write Code Yourself If You Want
**Good:** "I wrote the auth module, here's what it does..."
**Good:** "I'm editing config.json manually, I'll tell you when done"
**Also Good:** "Add rate limiting to auth endpoints" (let Claude do it)

### ❌ DON'T: Assume Claude Remembers
**Bad:** Starting new task without mentioning the workflow
**Good:** Always include "follow DEVELOPMENT_WORKFLOW.md" reminder

### ❌ DON'T: Skip Issue Creation
**Bad:** Jump straight to implementation
**Good:** Create issue first with workflow reminder built in

## Speed Hacks

### 1. Use Issue Numbers
Instead of explaining features, create issues and reference them:
```
You: Create issues for: auth refactor, add caching, fix performance.
     Include DEVELOPMENT_WORKFLOW.md reminder in each.
You: Work on all three issues, following the workflow
```

### 2. Reference Examples
```
You: Make the new endpoint like the one in user-controller.js
You: Follow the same pattern as the existing tests
```

### 3. Batch Similar Tasks
```
You: Add input validation to all API endpoints
You: Convert all class components to functional components
```

### 4. Trust the Process (When Reminded)
The explore → plan → test → implement workflow prevents bugs - but only if Claude remembers to use it!

## Quality Guarantees (With Reminders)

When you remind Claude about DEVELOPMENT_WORKFLOW.md:
- ✅ Writes tests before code (TDD)
- ✅ Explores before coding (prevents mistakes)
- ✅ Plans with deep thinking (better architecture)
- ✅ Verifies with subagents (catches edge cases)
- ✅ References SPEC/ARCHITECTURE (stays aligned)

Without reminders, Claude may:
- ❌ Jump straight to coding
- ❌ Skip writing tests
- ❌ Miss edge cases
- ❌ Create brittle solutions

## Real Session Example

```
You: We need to add pagination to all list endpoints

Claude: [Creates issue #67 with details]
        [Explores existing endpoints]
        [Plans pagination approach]
        [Writes tests for pagination]
        [Implements pagination]
        [Commits]

You: Make the default page size configurable

Claude: [Updates implementation immediately]

You: Add cursor-based pagination as an option too

Claude: [Adds feature while maintaining tests]

You: Good, ship it

Claude: [Creates PR with all changes]
```

Total time: 10 minutes for what would take hours manually.

## Advanced Patterns

### Specification-Driven Development
```
You: Create SPEC.md for the new payments module
You: Create ARCHITECTURE.md for the payments module
You: Create implementation issues from the spec
You: Start with issue #1
```

### Test-Driven Bug Fixes
```
You: Users report the search returns duplicates sometimes
```
Claude Code writes a test that reproduces it, then fixes it.

### Continuous Improvement
```
You: Review the codebase for security issues
You: Optimize database queries for performance
You: Update all dependencies and fix any breaking changes
```

## Debugging Assistance

```
You: The deployment is failing on staging
You: Customer reports timeout errors after 30 seconds
You: The tests pass locally but fail in CI
```

Claude Code investigates, identifies root causes, and fixes issues.

## Remember

**Your role:** Provide direction, decisions, and **workflow reminders**
**Claude Code's role:** Implementation, testing, and process (when reminded)

The workflow ensures quality doesn't suffer from speed - but only works when Claude remembers to follow it. A gentle reminder at the start of each task makes everything smoother.

## Quick Reference Card

1. **Create issue:** "Create issue for [feature], include DEVELOPMENT_WORKFLOW.md reminder"
2. **Start work:** "Work on issue #N, follow DEVELOPMENT_WORKFLOW.md"
3. **Fix something:** "The [thing] should [behavior]"
4. **Add feature:** "Add [feature], follow the workflow - explore first"
5. **Fix bug:** "[Describe bug]. Fix it using TDD - test first"
6. **Review:** "Address PR #N comments, follow workflow for changes"
7. **Explore:** "How does [system] work?"
8. **Refactor:** "Refactor [module], keep tests passing"
9. **Your code:** "I wrote [what], now you [task]"
10. **Done:** "Ship it" or "Create PR"

## The Magic Phrase

When in doubt, just add: **"Remember to follow DEVELOPMENT_WORKFLOW.md"**

This simple reminder dramatically improves the quality of Claude's work.

## Getting Started Today

1. Pick an issue from your backlog
2. Say: "Work on issue #N"
3. Watch the workflow execute
4. Provide feedback in natural language
5. Ship faster with higher quality

---

@DEVELOPMENT_WORKFLOW.md - Claude Code's internal workflow
@IMPLEMENTATION_CHECKLIST.md - Quick reference for implementation