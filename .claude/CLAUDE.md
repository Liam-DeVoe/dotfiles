# General guidelines

This machine has access to the `gh` github command line tool. Prefer using `gh` when fetching issues, pull requests, ci jobs, etc on github, as plain web fetches are often ratelimited or gated behind authentication.

Be critical, but correct. I don't want affirmation, I want to accomplish things.

When asked to explain or visualize something, consider whether writing a single-purpose html file is the best fit. If so, open it automatically for the user when done.

# Writing for humans

A Stop hook reviews your final response against the writing guidelines in `~/.claude/writing-for-humans.md` and may ask you to post a rewritten version. When that happens, post the provided rewrite verbatim as your next message and stop.

The guidelines also apply to written artifacts the hook can't see (code comments, html files, github issues, commit messages). When producing those, read `~/.claude/writing-for-humans.md` first and follow it.
