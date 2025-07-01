# AI Development Project Template

This is a project template for developing applications using AI Agents, Model Context Protocol (MCP) servers and LLMs to orchestrate the development workflow.

This template uses Mise to manage the project environment, including development applications (eg, Python, linters, etc) and secrets management (via SOPS + AGE).


## Setup

1. Clone repository
```
git clone https://github.com/x45dev/AI-Development-Project-Template.git my-project
```

2. Install/activate Mise and install tools.
```
# Install
curl https://mise.run | sh

# Activate
cd my-project
mise trust
mise install
mise doctor  # Validate configuration.
```

3. Generate AGE keys and encrypt `.env.sops.yaml`
```
# Generate a new key if required
mkdir -p "${HOME}/.config/sops/age"
age-keygen -o "${HOME}/.config/sops/age/keys.txt"
chmod 600 "${HOME}/.config/sops/age/keys.txt"

# Encrypt .env.sops.yaml
cp .env.sops.example.yaml .env.sops.yaml
sops encrypt --in-place .env.sops.yaml
```

4. Validate environment variables via Mise/SOPS
```
mise env
```

5. Install and configure [Fabric](https://github.com/danielmiessler/fabric)
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

6. Create a Memory Bank (YAML knowledge graph) and/or a PRD (Markdown files)
```
# Add the custom Fabric patterns
mkdir -p ~/.config/fabric/patterns/create_memory_bank
ln -s $(pwd)/docs/fabric-patterns/create_memory_bank.md ~/.config/fabric/patterns/create_memory_bank/system.md

mkdir -p ~/.config/fabric/patterns/create_memory_bank_prd
ln -s $(pwd)/docs/fabric-patterns/create_memory_bank_prd.md ~/.config/fabric/patterns/create_memory_bank_prd/system.md

# Apply it
echo "AI usage dashboard for an executive and technical audience. Tech stack: frontend with Starwind-UI and HTMX; backend with FastAPI with UV for Python Project management." | fabric -p create_memory_bank -v=today:"$(date +%Y-%m-%d)" 
> memory_bank_temp.md

echo "AI usage dashboard for an executive and technical audience. Tech stack: frontend with Starwind-UI and HTMX; backend with FastAPI with UV for Python Project management." | fabric -p create_memory_bank_prd -v=today:"$(date +%Y-%m-%d)" 
> prd_temp.md
```


# Credits
- Cline ([Memory Bank](https://docs.cline.bot/prompting/cline-memory-bank))
- Daniel Miessler ([Fabric](https://github.com/danielmiessler/fabric))
- Viktor Farcic ([My Workflow With AI](https://www.youtube.com/watch?v=2E610yzqQwg))
