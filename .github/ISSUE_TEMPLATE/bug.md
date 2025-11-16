---
name: Bug Fix
about: Template for bug fixes
title: ''
labels: 'type:bug'
assignees: ''
---

## Bug Description

[Clear description of the bug]

## Steps to Reproduce

1. Step 1
2. Step 2
3. Step 3

## Expected Behavior

[What should happen]

## Actual Behavior

[What actually happens]

## Implementation Workflow

**IMPORTANT**: Follow the [DEVELOPMENT_WORKFLOW.md](/DEVELOPMENT_WORKFLOW.md) guide.

### Bug Fix Workflow
1. **Explore**: Understand the bug context (NO CODING YET!)
2. **Write Failing Test**: Create test that reproduces the bug
3. **Verify Test Fails**: Confirm test shows the bug
4. **Commit Test**: Commit the failing test
5. **Fix Bug**: Implement fix until test passes
6. **Verify**: Check for similar bugs elsewhere
7. **Commit Fix**: Commit with test and fix

## Test Case

```
# Test that reproduces the bug
def test_bug_reproduction():
    # Setup that triggers bug
    # Assert expected behavior
    pass
```

## Root Cause Analysis

[After exploration, document the root cause]

## Fix Approach

[Document the planned fix approach]

## Acceptance Criteria

- [ ] Bug reproduction test created and fails initially
- [ ] Bug fixed (test passes)
- [ ] No regression in existing tests
- [ ] Similar bugs checked and fixed
- [ ] Root cause documented

## References

- **Related Code**: [file paths]
- **Specification**: See `/docs/SPEC.md` if relevant
- **Related Issues**: #[number]

---
⚠️ **Reminder**: Write the test FIRST, then fix the bug. This ensures the bug is actually fixed and prevents regression.