#!/bin/bash

echo "download model"
touch .env.local
echo "MONGODB_URL=${MONGODB_URL}" > .env.local
echo "HF_TOKEN=${HF_TOKEN}" >> .env.local
echo "NEO4J_USERNAME=${NEO4J_USERNAME}" >> .env.local
echo "NEO4J_URI=${NEO4J_URI}" >> .env.local
echo "NEO4J_PASSWORD=${NEO4J_PASSWORD}" >> .env.local
echo "OLLAMA_BASE_URL=${OLLAMA_BASE_URL}" >> .env.local
cat models_config/model.local >> .env.local
sed -i "s/model_placeholder/${MODEL}/g" .env.local
tmux new-session -d -s ollama "ollama run ${MODEL}"
echo "sleep for ${DOWNLOAD_TIME} minutes"
sleep ${DOWNLOAD_TIME}
npm install unplugin-icons
npm run dev -- --host :: --port 3000





