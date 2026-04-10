FROM python:3.11-slim-bookworm

# Install system dependencies + Google Chrome
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    curl \
    unzip \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    --no-install-recommends && \
    wget -q -O /tmp/google-chrome.deb \
      https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y /tmp/google-chrome.deb && \
    rm /tmp/google-chrome.deb && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first for layer caching
COPY requirements.txt .

# Install Python dependencies (skip langchain-huggingface heavy torch deps if not needed)
RUN pip install --no-cache-dir -r requirements.txt || \
    pip install --no-cache-dir \
        click \
        "httpx~=0.27.2" \
        inputimeout==1.0.4 \
        jsonschema==4.23.0 \
        jsonschema-specifications==2023.12.1 \
        langchain==0.2.11 \
        langchain-anthropic \
        langchain-community==0.2.10 \
        langchain-core==0.2.36 \
        langchain-google-genai==1.0.10 \
        langchain-ollama==0.1.3 \
        langchain-openai==0.1.17 \
        langchain-text-splitters==0.2.2 \
        langsmith==0.1.93 \
        Levenshtein==0.25.1 \
        loguru==0.7.2 \
        openai==1.37.1 \
        pdfminer.six==20221105 \
        "python-dotenv~=1.0.1" \
        "PyYAML~=6.0.2" \
        regex==2024.7.24 \
        reportlab==4.2.2 \
        selenium==4.9.1 \
        webdriver-manager==4.0.2 \
        undetected-chromedriver==3.5.5 \
        pytest pytest-mock pytest-cov \
        "git+https://github.com/feder-cr/lib_resume_builder_AIHawk.git"

# Copy the application
COPY . .

# Set headless mode environment variable
ENV CHROME_HEADLESS=true

# Default command
CMD ["python", "main.py"]
