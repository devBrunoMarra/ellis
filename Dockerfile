# Usar uma imagem oficial do Python como base
FROM python:3.10-slim

# Definir o diretório de trabalho no container
WORKDIR /app

# Copiar o arquivo de dependências para o diretório de trabalho
COPY requirements.txt requirements.txt

# Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o código do projeto para o diretório de trabalho
COPY . .

# Comando para rodar a aplicação quando o container iniciar
# Usando 0.0.0.0 para que seja acessível de fora do container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]