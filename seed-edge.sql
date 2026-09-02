-- Edge database seed: provider models for LLM, STT, TTS.
-- Re-runnable: deletes all existing rows and inserts fresh.
--
-- Usage (with the full-stack compose running):
--   docker compose exec -T edge-db psql -U "$EDGE_DB_USER" -d saasy-edge-db < seed-edge.sql
--
-- Trim this list to the providers you actually configured API keys for;
-- selecting a provider without a valid key will fail at session time.

BEGIN;

DELETE FROM llm_provider_models;
DELETE FROM stt_provider_models;
DELETE FROM tts_provider_models;

-- LLM providers
INSERT INTO llm_provider_models (provider, model_id, display_name) VALUES
  ('anthropic', 'claude-haiku-4-5-20251001',             'Anthropic Claude Haiku 4.5'),
  ('anthropic', 'claude-opus-4-5-20251101',              'Anthropic Claude Opus 4.5'),
  ('aws',       'mistral.mistral-large-3-675b-instruct', 'Mistral Large 3 (AWS)'),
  ('aws',       'qwen.qwen3-next-80b-a3b',               'Qwen3 Next 80B (AWS)'),
  ('gcp',       'google/gemini-2.5-flash',               'Google Gemini 2.5 Flash (GCP)'),
  ('groq',      'openai/gpt-oss-120b',                   'GPT-OSS 120B (Groq)'),
  ('openai',    'gpt-4.1',                               'OpenAI GPT-4.1'),
  ('openai',    'gpt-5.2',                               'OpenAI GPT-5.2'),
  ('xai',       'grok-4-1-fast-non-reasoning',           'xAI Grok 4.1 Fast');

-- STT providers
INSERT INTO stt_provider_models (provider, model_id, display_name) VALUES
  ('deepgram',     'nova-2',   'Deepgram Nova 2'),
  ('deepgram',     'nova-3',   'Deepgram Nova 3'),
  ('speechmatics', 'enhanced', 'Speechmatics Ursa 2 Enhanced');

-- TTS providers
INSERT INTO tts_provider_models (provider, model_id, display_name) VALUES
  ('cartesia',   'sonic-2',           'Cartesia Sonic 2'),
  ('cartesia',   'sonic-3',           'Cartesia Sonic 3'),
  ('elevenlabs', 'eleven_turbo_v2_5', 'ElevenLabs Turbo v2.5');

COMMIT;
