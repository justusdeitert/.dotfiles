# Common pitfalls

- ISO 8601 timestamps do NOT sort lexicographically the same as chronologically when timezone offsets differ (e.g. `2026-04-12T15:25:07Z` vs `2026-04-12T17:22:31+02:00`). Always parse to epoch (Date.parse / getTime) before ordering or comparing.
