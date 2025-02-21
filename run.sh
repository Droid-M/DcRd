#!/bin/bash

# Nome do ambiente virtual
VENV_DIR="venv"
# Caminho para o arquivo requirements.txt
REQ_FILE="source/requirements.txt"
# Caminho para o script principal
MAIN_SCRIPT="source/main.py"

# Caminho correto para os binários python e pip do venv (para evitar ter que ativar o ambiente ou usar `source`)
PYTHON="$VENV_DIR/bin/python"
PIP="$VENV_DIR/bin/pip"

# Criar o ambiente virtual se não existir
if [[ ! -d "$VENV_DIR" ]]; then
    echo "Criando ambiente virtual '$VENV_DIR'..."
    python3 -m venv "$VENV_DIR"
fi

# Verificar se requirements.txt existe e instalar dependências
if [[ -f "$REQ_FILE" ]]; then
    echo "Instalando dependências de $REQ_FILE..."
    "$PIP" install -r "$REQ_FILE"
else
    echo "Arquivo $REQ_FILE não encontrado. Nenhuma dependência será instalada."
fi

# Executar o script Python sem buffering
if [[ -f "$MAIN_SCRIPT" ]]; then
    clear
    echo "Executando $MAIN_SCRIPT..."
    "$PYTHON" -u "$MAIN_SCRIPT"
else
    echo "Arquivo $MAIN_SCRIPT não encontrado."
fi
