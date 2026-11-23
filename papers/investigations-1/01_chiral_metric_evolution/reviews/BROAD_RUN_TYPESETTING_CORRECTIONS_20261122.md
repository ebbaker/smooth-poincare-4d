# Broad-run typesetting corrections

22 November 2026, America/New_York. Prepared for Edward B. Baker III with OpenAI assistance. Selected lead actual settings unavailable. These edits disambiguate mathematical brackets from Markdown link syntax; formulas and evidence scopes are unchanged. Frozen input and earlier assessment hashes remain historical versions, not hashes of the corrected files.

- `brainstorm/notes/B04_PINCHED_ENDPOINT_DECISION_20261122.md`: prior SHA-256 `61a13e15a1742c903baf6fb89330364fb2a7163a8af5d61fe1f356c16de8daed`, corrected `89645241894e0ffd1cdf0b7a5dbb56a78884dc7e14264429fb0549845263483c`.
- `notes/07_PINCHED_ENERGY_GAP_20261122.md`: prior SHA-256 `107896b78624f02ccb83f1712139f294a4cee1f06f5e96d9e2775659effea753`, corrected `cbb2f95b2961cb1772014e311ec9b759af88ebd0f739a6d0556c6a0fe3d8d3bb`.
- `notes/13_SMOOTH_SCALAR_BARRIER_TEST_20261122.md`: prior SHA-256 `2b06dacb36205c2d4629d7169dc227c8b498d870ca05dba04f35e476aaa1c55a`, corrected `91f87b6d5655cd03ec0ac1f4a692df05a2848a873406feb41938a542ccdb0ae7`.
- `research-progress/handoffs/SP4-CME-E05_RETURN_v1.md`: prior SHA-256 `d563aa0196b6e2b78f6cde82bd133326f71e197d4fa14d28c1b9d26869cca0e2`, corrected `71578ec0a69ea711dc41fc716ba43a2695ed4132ccb00e74c04df340aad75c52`.
- `notes/18B_STRAIN_ENERGY_ESTIMATE_20261122.md`: after E19 finished, disambiguated three derivative applications from Markdown links. Prior SHA-256 `3f1854a9facef8e1f773ffa482807f9064188b56ac9b98ab5429692dc7ceee42`, corrected `713aa0bd1c9a3644d57208fa6ae30b4fdcd18df060197b03ef0b39afcb800437`.

## E67 literal control-character repair — 22 November 2026

E72 identified five literal carriage-return bytes in intended TeX roman-font commands. The lead replaced each byte 0x0d with bytes 0x5c 0x72, leaving all other bytes unchanged. Zero-based original byte offsets: 3914, 3965, 6496, 7115, 7138. Original consumed SHA-256: abfb4370645ac042a039629dd4725bf67a0bb81897f52cf4ac49fdbe26c0c0c8. Corrected SHA-256: 96a962b3c40f682443b4d52d021633a83f13bbf8b1d9d5ae8693b3bdc67eb357. This byte recipe exactly reconstructs either version; no mathematical content changed. E67/E69/E74 frozen inputs and earlier assessments continue to identify their actual original consumed hash. Later consumers may use the corrected hash with this record. No manuscript snapshot or provenance rewrite was made.
