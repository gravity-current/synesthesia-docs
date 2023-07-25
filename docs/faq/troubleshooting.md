# Troubleshooting FAQ

### Some scenes are totally black or seem unresponsive, is it broken?
The main two reasons that a scene would appear black are missing audio or missing media.

Synesthesia is built to be run with a live audio stream. Without it, some scenes won't do anything at all. See ["how do I set up my audio input?"](./audio.md#how-do-i-set-up-my-audio-input) for more info.

Certain scenes are built entirely around media, and use it to supply color or action to the scene. Without any media selected, these scenes may appear black. See ["how can I mix my own images or videos into a scene?"](./index.md#how-can-i-mix-my-own-images-or-videos-into-a-scene) for information on adding media to scenes.

If you know the issue is not audio or media related, go to the edit panel on the right and scroll to the bottom of the console output. If there are any errors rendering scenes, you should see them appear in red there.

---

### The FPS seems low, and the visual output looks choppy.
Synesthesia runs its scenes using Shaders, which are programs that run directly on the GPU. Every scene will take a different time-to-render depending on how much work the GPU has to do. Ideally, when this is time-to-render is faster than 60 FPS, Synesthesia will cap it to 60 FPS and you'll get smooth performance. However, you may find that some scenes are too computationally intense to run on your GPU at 60 FPS, here are your options:

1. Lower the resolution in the Settings panel (sacrifice resolution for better performance).
2. Turn off other applications that may be using the GPU.
3. Cool down your laptop by elevating it or using an external fan.
4. When all else fails, avoid using intense scenes. Stick to simpler scenes that can run at 45 FPS or above on your machine.

---

### Synesthesia was working fine but now crashes on launch...
You may have a corrupted settings file or have some settings saved that won't work with your computer's current audio/video hardware state. You could try launching Synesthesia with audio or video peripherals unplugged to see if hardware is causing the issue. If that doesn't work, the problem is likely a corrupted user settings file. You can manually locate your settings files, back them up, and delete them one by one to locate the problem file. Synesthesia will automatically re-create any deleted file in a "factory fresh" state.

**Windows**

1. Go to your C: Drive, then head to the following path: `C:\Users\YOUR USER NAME\AppData\Local\Synesthesia\Data`
2. Note that AppData is a "Hidden" folder. You'll have to have hidden items visible in your view settings. At the top of an Explorer Window, click "View" and then find the check box to enable "Hidden Items".

**macOS**

1. In Finder, press `Command + Shift + G`.
2. Copy and paste this path into the prompt: `~/Library/Application Support/com.gravitycurrent.synesthesia/Data`

**Both**

Once you get to the "Data" folder, go ahead and save a backup of the entire Data folder so you can get your control presets or midi mappings back afterwards. Make sure you quit Synesthesia before continuing. Now delete all the files in this folder.

With those deleted, try to start Synesthesia. This should let you avoid any crashes on launch due to any of those files being corrupted, or saved settings failing to work on your computer.

---

### Windows only: I'm just seeing a white screen when I open the app.

Usually a white screen means that Synesthesia isn't able to find some internal code files. Try deleting the app resources folder and reinstalling Synesthesia. This should be the folder `C:\Program Files (x86)\Synesthesia`

---

### Performance is poor, but I have a good dedicated graphics card, what is going on?
1. Make sure your laptop is plugged in. Windows automatically turns off performance graphics if your laptop is not plugged in.
2. You may be launching Synesthesia with "Integrated Graphics" as the specified GPU to use. When launching Synesthesia, right click and select "open with Dedicated GPU", or go to the Nvidia Control Panel and ensure Synesthesia is selected to "always run" on dedicated GPU.

---

### macOS only: When I fullscreen the visualizer, my main display goes black so I can't use the GUI?
If you lose your main display, giving you a black screen and making you unable to access Synesthesia's GUI while the fullscreen output is open, you need to modify your macOS System Settings. Set "Mission Control" -> "Displays have separate Spaces" to ON. You will need to log out of macOS and back in for the changes to take effect, but then you should be able to use both displays at once.

---

### Windows only: I get "VCRUNTIME140.dll is Missing" error when I try to open the app.
This occurs when your computer's C++ Libraries are out of date with the version Synesthesia uses, for one reason or another. You can easily add the version that Synesthesia needs without affecting the rest of your computer. Follow these steps:

1. Get [Microsoft Visual C++ Redistributable from official Microsoft website](https://www.microsoft.com/en-us/download/details.aspx?id=52685). Select a language and click Download.
2. You will be taken to a page which will ask you to choose the download you want. There will be two files, you want the one labeled vc_redist.x86.exe, so check the box next to x86.exe and click Next.
3. Open the downloaded file and allow it to install.
4. Start Synesthesia.