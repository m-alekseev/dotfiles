---
name: yt-transcript
description: Fetch and search YouTube video transcripts by timestamp. Use when the user gives a YouTube URL or video and asks what's said about a topic, for quotes, or where something specific happens in it.
---
When the user gives a YouTube URL/video and asks about its content:

1. Fetch the transcript (skip if `$TMPDIR/yt-transcripts/<video_id>.txt` already exists):
   ```
   uv run ~/.claude/skills/yt-transcript/scripts/fetch_transcript.py <url_or_video_id>
   ```
   Writes `<video_id>.txt` into a `yt-transcripts` folder under the system temp directory as
   timestamped `HH:MM:SS  text` lines. Pulls auto-generated or manual English captions via
   `yt-dlp` (`--lang` to change). The script declares its own dependencies (PEP 723), so
   `uv run` handles it standalone — no project setup needed, just `uv` and `yt-dlp` on PATH
   via uv's ephemeral env.

2. Search it for the relevant topic:
   ```
   uv run ~/.claude/skills/yt-transcript/scripts/search_transcript.py <path_to_txt> "<regex>" -C 1
   ```
   Case-insensitive regex. `>` marks matched lines, `-C N` adds N lines of context,
   `--` separates non-contiguous match groups.

3. Report findings with their timestamps — don't dump the whole transcript back.

If `yt-dlp` finds no captions for the video, say so rather than guessing at content.
