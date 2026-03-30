const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Configuration
const ARB_FILE = path.join(__dirname, '../lib/l10n/app_de.arb');
const LIB_DIR = path.join(__dirname, '../lib');
const REGEX_L10N = /l10n\s*\(\s*["'](.*?)["']\s*\)/g;

/**
 * Normalizes a string to a snake_case key
 */
function toKey(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]/g, '_')
    .replace(/_{2,}/g, '_')
    .replace(/^_|_$/g, '');
}

/**
 * Recursively find all .dart files
 */
function getDartFiles(dir, files = []) {
  fs.readdirSync(dir).forEach(file => {
    const fullPath = path.join(dir, file);
    if (fs.statSync(fullPath).isDirectory()) {
      getDartFiles(fullPath, files);
    } else if (file.endsWith('.dart')) {
      files.push(fullPath);
    }
  });
  return files;
}

/**
 * Extract strings from files
 */
function extractStrings() {
  const strings = new Map();
  const files = getDartFiles(LIB_DIR);

  files.forEach(file => {
    const content = fs.readFileSync(file, 'utf8');
    let match;
    while ((match = REGEX_L10N.exec(content)) !== null) {
      const text = match[1];
      const key = toKey(text);
      if (!key) continue; // Skip empty text
      strings.set(key, text);
    }
  });

  return strings;
}

/**
 * Main Bridge Logic
 */
async function sync() {
  console.log('🚀 Lingo.dev Flutter Bridge - Syncing Code to ARB...');

  // 1. Load existing ARB
  let arb = {};
  if (fs.existsSync(ARB_FILE)) {
    arb = JSON.parse(fs.readFileSync(ARB_FILE, 'utf8'));
  } else {
    arb = { "@@locale": "de" };
  }

  // 2. Extract new strings from code
  const extracted = extractStrings();
  let addedCount = 0;

  extracted.forEach((value, key) => {
    if (!arb[key]) {
      arb[key] = value;
      addedCount++;
      console.log(`   + Added: "${key}" -> "${value}"`);
    }
  });

  // 3. Save updated ARB
  if (addedCount > 0) {
    fs.writeFileSync(ARB_FILE, JSON.stringify(arb, null, 2), 'utf8');
    console.log(`✅ Success! Added ${addedCount} new strings to app_de.arb.`);
  } else {
    console.log('✨ No new strings found in code.');
  }

  // 4. (Optional) Auto-trigger Lingo.dev translation
  try {
    console.log('\n🌍 Triggering Lingo.dev Translation Pipeline...');
    execSync('npx lingo.dev@latest run', { stdio: 'inherit', cwd: path.join(__dirname, '..') });
    console.log('🎉 Translation Complete!');
  } catch (error) {
    console.error('❌ Lingo.dev run failed. Still synced ARB file locally.');
  }
}

sync();
