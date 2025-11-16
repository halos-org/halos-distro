# Human Development Guidance - Agentic Coding with Claude Code

**Last modified:** 2025-11-16

This guide helps you leverage Claude Code effectively to develop faster while improving quality. The key is knowing what to ask for and when.

## Quick Start: Your Development Session

### 1. Start with the Issue
```
You: Work on issue #42
```

Claude Code will:
- Read the issue
- Explore relevant code WITHOUT coding first
- Plan the approach (using "think hard")
- Write tests FIRST
- Implement until tests pass
- Commit with proper message

### 2. If Something's Wrong, Just Say It
```
You: The authentication should use JWT, not sessions
You: That breaks the existing API contract
You: The tests should cover edge case X
```

Claude Code immediately adjusts without you needing to fix it yourself.

## Core Principles for Speed + Quality

### 🎯 Be Direct and Specific
**Fast:** "Implement issue #42"
**Faster:** "Implement issue #42, use the existing Redis cache"
**Fastest:** "Implement issue #42, use Redis cache, follow the pattern in user-service.js"

### 🔄 Iterate in Natural Language
Instead of editing code yourself:
```
You: The error handling needs to retry 3 times
You: Add logging for each retry attempt
You: Use exponential backoff
```

Each instruction immediately updates the implementation.

### ✅ Let Claude Code Handle the Process
The workflow (explore → plan → test → implement) happens automatically. You don't need to manage it.

## Common Scenarios

### Starting a New Feature
```
You: Create issue for adding user notifications feature
You: Work on issue #[created number]
```

### Fixing a Bug
```
You: There's a crash when users input empty passwords. Fix it.
```
Claude Code will:
- Create a bug issue
- Write a test that reproduces it
- Fix the bug
- Verify the test passes

### Code Review Feedback
```
You: PR #55 has review comments about security. Address them.
```
Claude Code reads the PR, understands feedback, and implements fixes.

### Refactoring
```
You: Refactor the auth module to use the new pattern we discussed
```
Claude Code will explore, plan, ensure tests still pass, and refactor.

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

## What NOT to Do

### ❌ Don't Micromanage the Process
**Bad:** "First read the files, then make a plan, then write tests..."
**Good:** "Implement feature X" (process happens automatically)

### ❌ Don't Write Code Yourself
**Bad:** [Paste code snippet] "Add this to auth.js"
**Good:** "Add rate limiting to auth endpoints using pattern X"

### ❌ Don't Edit Files Manually
**Bad:** Edit file, then ask Claude to continue
**Good:** Tell Claude what to change in natural language

## Speed Hacks

### 1. Use Issue Numbers
Instead of explaining features, create issues and reference them:
```
You: Create issues for: auth refactor, add caching, fix performance
You: Work on all three issues
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

### 4. Trust the Process
The explore → plan → test → implement workflow prevents bugs. Let it run.

## Quality Guarantees

Claude Code automatically:
- ✅ Writes tests before code (TDD)
- ✅ Explores before coding (prevents mistakes)
- ✅ Plans with deep thinking (better architecture)
- ✅ Verifies with subagents (catches edge cases)
- ✅ References SPEC/ARCHITECTURE (stays aligned)

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

**Your role:** Provide direction and decisions
**Claude Code's role:** Implementation, testing, and process

The more you trust the process, the faster you go. The enforced workflow ensures quality doesn't suffer from speed.

## Quick Reference Card

1. **Start work:** "Work on issue #N"
2. **Fix something:** "The [thing] should [behavior]"
3. **Add feature:** "Add [feature] like in [example]"
4. **Fix bug:** "[Describe bug]. Fix it."
5. **Review:** "Address PR #N review comments"
6. **Explore:** "How does [system] work?"
7. **Refactor:** "Refactor [module] to [pattern]"
8. **Test:** "Add tests for [feature]"
9. **Deploy:** "Deploy to [environment]"
10. **Done:** "Ship it" or "Create PR"

## Getting Started Today

1. Pick an issue from your backlog
2. Say: "Work on issue #N"
3. Watch the workflow execute
4. Provide feedback in natural language
5. Ship faster with higher quality

---

@DEVELOPMENT_WORKFLOW.md - Claude Code's internal workflow
@IMPLEMENTATION_CHECKLIST.md - Quick reference for implementation