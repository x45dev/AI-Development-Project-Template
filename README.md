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

5. Optional: Install and configure [Fabric](https://github.com/danielmiessler/fabric)
```
go install github.com/danielmiessler/fabric@latest
fabric --setup
fabric --shell-complete-list
sudo mv completions/fabric.bash /etc/bash_completion.d/
```
