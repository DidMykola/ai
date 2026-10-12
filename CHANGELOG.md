# Changelog

All notable changes to the skills in this repository. Each skill is versioned independently in its `package.json`.

## didww-to-livekit 1.1.0, didww-connect 1.0.1 (2026-10-09)

`didww-to-livekit`, verified end to end on LiveKit Cloud:

- Trunks are encrypted by default: `connect.py` now defaults to `--transport tls --srtp require`, and the skill sets the DIDWW inbound trunk to port 5061, TLS and SRTP SDES. Plain trunks are an opt-out (`--transport tcp --srtp disable`).
- `connect.py --sip-uri` (or `LIVEKIT_SIP_URI`) takes the SIP URI from the project settings. It is no longer derived from the Project URL, whose subdomain is different.
- `connect.py --outbound-only` adds the outbound trunk to a project that already has the inbound side.
- Both LiveKit trunks limit codecs to PCMA and PCMU and set `media.encryption`; the deprecated `media_encryption` field is no longer sent.
- The DIDWW outbound trunk is created by the user in the DIDWW panel, because the DIDWW MCP has no outbound trunk tools. The skill lists the LiveKit Cloud static IP ranges for its allowed IP list.
- Failure map rewritten from observed responses: `400 Bad Request` and `500 No suitable media` on SRTP mismatch, `484`, and `404` is not caused by a missing `+`.

`didww-connect`: LiveKit dashboard labels corrected (Settings, API keys; SIP URI).

## 1.0.0 (2026-10-01)

Initial public release of nine Claude Code agent skills, each installable with `npx <name>`:

- `didww-connect`: platform choice, universal DIDWW wiring, health monitor.
- `didww-to-elevenlabs`, `didww-to-vapi`, `didww-to-retell`, `didww-to-ultravox`, `didww-to-vogent`: hosted voice platforms.
- `didww-to-openai-realtime`, `didww-to-xai`: direct SIP to a model provider with a user-run backend.
- `didww-to-livekit`: bring-your-own-brain agents on LiveKit Cloud or self-hosted.

Also: per-skill tests with stubbed HTTP, GitHub Actions, and documentation drafts for doc.didww.com in `docs/`.
