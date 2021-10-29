# usage

1. generate config from xmrig tool (see their website)
2. save as `.json`
3. mount and run (example, if your file is `config.json`):
   ```bash
   docker run -v $(pwd)/config.json:/xmrig/build/config.json camerondurham/xmrig-basic:v0
   ```
