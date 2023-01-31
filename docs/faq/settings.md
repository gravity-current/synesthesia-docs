# Settings FAQ

### Settings Checklist: Optimize your computer for Synesthesia
You'll get the best performance and have the best experience using Synesthesia if you use these recommended settings.

**macOS**

- Desktop & Screen Saver -> Screen Saver -> Start after: Never.
- Mission Control -> Displays have separate Spaces: ON (might require you to log out and back in)
- Display -> Resolution: Scaled -> More Space (will set your main desktop to 1080p, which is ideal for displaying Synesthesia's GUI)
- Arrangement -> Mirror Displays: OFF
- Energy Saver -> Automatic graphics switching: OFF
- Sound -> Input -> External Microphone -> Input volume: Set depending on the audio level in the environment you're using

**Windows**

- If on a machine with Nvidia Optimus settings, right click on Synesthesia and select "Run with Graphics Processor" and set Synesthesia to always run with "High-performance Graphics Processor".
- Add Synesthesia to your Firewall allowed list, and run as an administrator if you run into any permissions errors.
- Use a resolution of 1080p or higher for your main display (perhaps turning down application zoom percent to 100%, or suitable so more of the GUI is visible on your screen).

---


### Where are my settings, playlists, midi mappings, and presets saved?
Every once in a while you'll need to locate your settings files, either to back them up, to edit them directly, or perhaps to reset them and start fresh. The settings files are stored where many applications save extra data, your "AppData" or "Application Support" folder, depending on OS. You can still access these files, it just takes a few steps to get there. Note that once you open them, they'll just appear as one long line of text. You may want to copy/paste the contents into a JSON parser to make sure you're editing them safely, like https://jsonformatter.org/json-parser. Changing these files outside of  Synesthesia can lead to crashes if you aren't careful.

**Windows**

1. Go to your C: Drive, then head to the following path: `C:\Users\YOUR USER NAME\AppData\Local\Synesthesia\Data`
2. Note that AppData is a "Hidden" folder. You'll have to have hidden items visible in your view settings. At the top of an Explorer Window, click "View" and then find the check box to enable "Hidden Items".

**macOS**

In Finder, press `Command + Shift + G`.
Copy and paste this path into the prompt: `~/Library/Application Support/com.gravitycurrent.synesthesia/Data`