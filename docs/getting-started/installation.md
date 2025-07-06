# Installation
FIXME (@gemini): This needs to be updated to reflect the .devcontainers patter.

This section guides you through setting up the project environment.

## Setup

1. Clone repository
```
git clone https://github.com/x45dev/AI-Development-Project-Template.git my-project
```

2. Install/activate Mise and install tools.
```
# Install Mise
curl https://mise.run | sh

# Activate Mise
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
cp ./config/.env.sops.example.yaml ./config/.env.sops.yaml
sops encrypt --in-place ./config/.env.sops.yaml
```

4. Validate environment variables via Mise/SOPS
```
mise env
```

5. Install and configure an agentic coder (Gemini / Claude Code / Cline / Cursor / etc - your choice!)
```
# Install Gemini CLI
npm install -g @google/gemini-cli  # Global install

# Verify installation
gemini --version
which gemini

# Follow the relevant docs for first-time setup ...
```
