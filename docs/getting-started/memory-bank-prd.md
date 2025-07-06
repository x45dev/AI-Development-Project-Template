# Memory Bank and PRD

This project uses `fabric` to create a memory bank and PRD.

1. Install and configure [Fabric](https://github.com/danielmiessler/fabric)
```
# Install
go install github.com/danielmiessler/fabric@latest
fabric --setup

# Clone repo to access the `completions/` directory
pushd $(mktemp -d)
git clone https://github.com/danielmiessler/Fabric.git 
sudo mv Fabric/completions/fabric.bash /etc/bash_completion.d/
popd
```

2. Create a Memory Bank (YAML knowledge graph) and/or a PRD (Markdown files)
```
# Add the custom Fabric patterns
mkdir -p ~/.config/fabric/patterns/create_memory_bank
ln -s $(pwd)/docs/workflows/fabric_create-memory-bank.md ~/.config/fabric/patterns/create_memory_bank/system.md

mkdir -p ~/.config/fabric/patterns/create_memory_bank_prd
ln -s $(pwd)/docs/fabric-patterns/create_memory_bank_prd.md ~/.config/fabric/patterns/create_memory_bank_prd/system.md

# Apply it (example: "AI usage dashboard...")
echo "AI usage dashboard for an executive and technical audience. Tech stack: frontend with Starwind-UI and HTMX; backend with FastAPI with UV for Python Project management." | fabric -p create_memory_bank -v=today:"$(date +%Y-%m-%d)" 
> memory_bank_temp.md

echo "AI usage dashboard for an executive and technical audience. Tech stack: frontend with Starwind-UI and HTMX; backend with FastAPI with UV for Python Project management." | fabric -p create_memory_bank_prd -v=today:"$(date +%Y-%m-%d)" 
> prd_temp.md
```
