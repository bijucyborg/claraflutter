# Playbook: Alles Klara Localization Automation Demo

This playbook guides you through the live demonstration of lingo.dev localization for your client, showing how a German-first Flutter app can be automatically translated into English and Slovakian using your own Google Gemini infrastructure.

---

## 1. Prerequisites (For the Demo)

1.  **Google Cloud Gemini API Key**: Get one from the [Google AI Studio](https://aistudio.google.com/app/apikey).
2.  **Lingo.dev CLI**: Install globally with `npm install -g lingo.dev` or run via `npx`.

---

## 2. Setting Up the Local Environment

1.  **Open the project folder**:
    ```bash
    cd /Users/bijukrishnan/datasiens/Admin/gitdownloads/claraflutter
    ```
2.  **Setup the API Key**:
    Copy the `.env.example` file to `.env` and paste your Gemini API key:
    ```bash
    cp .env.example .env
    # Edit the file: GOOGLE_API_KEY=YOUR_GEMINI_KEY
    ```

---

## 3. Highlighting the Code to the Client

Show the client these files to demonstrate **minimal effort**:
- `lib/l10n/app_de.arb`: The **only source of truth** (German).
- `i18n.json`: The **"intelligence" config** specifying the translation engine (Gemini) and target languages (en, sk).
- `.github/workflows/translate.yml`: The **"set and forget" automation** that re-translates on every push.

---

## 4. Run the Live Demo (The "Compiler" Experience)

This is the "Wow" factor: You write code in German, and the automation handles the rest.

### Step A: Start with German ("Before")
1.  **Initialize the project**:
    ```bash
    flutter pub get
    # Note: We use a custom bridge, so no need for 'flutter gen-l10n' manually
    ```
2.  **Run the app**:
    ```bash
    flutter run -d chrome
    ```
3.  **Show the Client**: The app is in **German** (e.g., "Beratung").

---

### Step B: The "Zero-Ceremony" Workflow ("During")
1.  **Add a new feature in German**: Open `lib/main.dart` and add a new menu item or text using the `l10n` helper.
    - Example: `Text(widget.translate(l10n("Willkommen bei Alles Klara!")))`
2.  **Run the Flutter Bridge**:
    ```bash
    GOOGLE_API_KEY=your_key node scripts/lingo-flutter.js
    ```
3.  **Confirm the Automation**: Show the client that `lib/l10n/app_de.arb` was updated **automatically** and the English/Slovakian translations were generated instantly.

---

### Step C: Show the Results ("After")
1.  **Toggle the Language**: Use the **Language Icon** (Globe) in the app to select **Slovenský**.
2.  **Show the Result**: The new text you just wrote in German is now live in Slovakian!

---

## 5. Demonstrating CI/CD (GitHub Automation)

1.  **Push to GitHub**: Create a new private repo and push these files.
2.  **Add the Secret**: Add `GOOGLE_API_KEY` to your **GitHub Repo Settings > Secrets and variables > Actions**.
3.  **Trigger the Workflow**:
    - Update a string in `lib/l10n/app_de.arb` (e.g., change "Willkommen" to "Herzlich Willkommen").
    - Commit and push.
4.  **Show the Result**: 
    - Within 30-60 seconds, a new commit will appear from "Lingo.dev Bot" with the updated English and Slovakian files.
    - **This is the "Wow" moment for the client.** No more manual spreadsheets.

---

## 6. The "Service Dependency" Angle

Explain to the client how you will manage this monthly:
1.  **Quality Control**: Reviewing the AI-generated translations to ensure legal/financial accuracy.
2.  **Glossary Management**: Manually adding terms that should never be translated (like "Alles Klara").
3.  **Prompt Tuning**: Adjusting the AI instructions as the app scales (e.g., formal vs. informal tone).
4.  **Security/Privacy**: You manage the Gemini API billing and security, so they don't have to deal with GCP IAM and billing.

---

## 7. Demonstrating "Before and After"

To show the transformation to the client:
1.  **Before (German)**: Point to the German text in `lib/main.dart` wrapped in `l10n("...")`.
2.  **During**: Run `node scripts/lingo-flutter.js`.
3.  **After (English/Slovakian)**: Switch the app language to English. Show how the same code now displays English.
4.  **Visual Proof**: Use the generated mockups in the `visual_comparison.md` artifact to show the premium "Japandi" UI.

---

**Happy Demoing!** 🚀
