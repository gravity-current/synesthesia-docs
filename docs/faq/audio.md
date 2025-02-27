# Audio Settings

### How do I set up my Audio Input?
- To select an audio device, go to the Settings panel and select from the drop down menu next to "Audio Device".
- To refresh this list and scan for newly attached devices, click the refresh button right next to the drop down.

Once you've selected a device, look over to the audio indicator under the preview window on the right-hand side. It should have a green line showing the incoming audio level. Otherwise, if you see the whole indicator glowing red, that means no signal is detected. Try restarting your audio devices, adjusting the incoming microphone level in your computer's system settings, or try a different audio input device.

> Important note: Synesthesia requires an audio input device to function well. Simply playing music through your speakers or aux port is using an audio output device and will not automatically route into Synesthesia. Synesthesia on Windows has a "Desktop Audio" device to accomplish this, while on Mac you'll to use software like Blackhole or Loopback. For more on this, see see ["How can I play music from iTunes or Spotify into Synesthesia?"](#how-can-i-play-music-from-itunes-or-spotify-into-synesthesia)

---

### What is the best way to get audio into Synesthesia?

Synesthesia is built to be run with a live audio stream, so while you are testing performance or while you're using it live, you'll want to make sure it is receiving an audio stream of some kind.

In general you don't have to worry about carefully setting audio levels for Synesthesia to work. We try to make the audio reactivity as reliable and consistent as possible, across all microphone qualities and volumes. However, if the signal is too quiet (coming in at less than 1%) or too loud (stuck at 100% and clipping), the audio engine won't behave as it should. Some clipping or periodic silence is fine.

Here are a few different options for audio input:

**Built-in Microphone**

For a live show, the easiest and most reliable option is to just use your laptop's built-in microphone. Synesthesia's audio engine will work just fine with this sort of "lower quality" audio input. You'll need to make sure the volume of the music in the venue is loud enough that it is the primary thing the computer is hearing (IE, not hearing only your conversation or crowd noises).

If the audio indicator is yellow, it means the audio input is too loud and clipping. In this case, you should lower your computer's microphone input volume in the microphone settings. 

- On macOS this is in your System Preferences -> Sound -> Input.
- On Windows this is at Settings -> Sound -> Input -> Device properties -> Volume

While using a "room mic" like this, you'll always get a bit of crowd-reactive visuals as well, but you can get around this with a fade out at the end of songs, or just embrace it. In smaller venues it can be fun.

While at home, you can also use the built-in microphone. Just make sure the music you're playing is loud enough that your microphone is getting a decent signal.

**Audio Interface**

This is the best way to get a "clean" audio signal to Synesthesia. Connect your audio interface, make sure any drivers and/or support softwares that the hardware requires are installed, and then run Synesthesia. Many audio interfaces have multiple channels or inputs available. Currently, Synesthesia doesn't have advanced input selection options. It will default to the first input on your device and combine all channels available on that input into one mix.

At a live show you could ask the sound person for a mixed audio signal to send over an XLR or quarter-inch cord input to your Audio Interface, and then the audio signal will be available on your computer via the USB connection. However, keep in mind a few small issues with this approach:

- Your audio signal is now dependent on someone else's hardware. If they change something, you may lose audio during the show and have to switch back to a mic
- The setup will be different everywhere you go, or even change over the course of the night, depending on the sound board's mix setting, the instruments on stage, etc.

**Desktop Audio (Windows) or Third Party Audio Loopback Software (macOS)**

Use this if you want to capture the audio off of the same computer that is running Synesthesia. See ["How can I play music from iTunes or Spotify into Synesthesia?"](#how-can-i-play-music-from-itunes-or-spotify-into-synesthesia)

---

### How can I play music from iTunes or Spotify into Synesthesia?

Desktop Audio (Windows) / Third Party Loopback Software (macOS)

Computer operating systems treat audio output devices, like speakers or headphones, differently from audio input devices, like microphones. Synesthesia requires an audio ***input*** device in order to get a live audio feed to analyze. However, it's easily possible to route your audio output back into Synesthesia as input through a virtual loopback. On Windows this is already built-in to Synesthesia. Simply select the audio device labeled "Desktop Audio" to route your system's audio output directly into Synesthesia. On macOS, while it cannot be built-in to Synesthesia at this time, there exist excellent third party workarounds that will allow you to easily accomplish the same thing.

**macOS**

On macOS, installing a third party audio loop back software is required, but it just takes a few minutes to get any of the below options working. [Here is a guide that explains how to set up SoundSiphon](https://www.synesthesia.live/resources/sound-siphon-help.pdf), one of the best options listed below. Here are the four best audio loop back softwares we've encountered for macOS.

- [Sound Siphon](https://staticz.com/soundsiphon/) - 14 day trial, well supported
- [BlackHole](https://github.com/ExistentialAudio/BlackHole?tab=readme-ov-file#download-installer) - Free and better for newer Macs
- [Soundflower](https://rogueamoeba.com/freebies/soundflower/) - Free but outdated, but may be good for older non-Apple-silicon Macs
- [Loopback](https://rogueamoeba.com/loopback/) - Alternative to Sound Siphon, 20min free trial each time it is launched

**Windows**

On Windows simply select "Desktop Audio" from the Audio Device dropdown menu in the Settings tab. A few notes on using Desktop Audio:

- Synesthesia will only listen to a single audio output device at a time. It will default to whatever audio output device you have selected in the Windows OS. To change what audio output device you want Synesthesia to listen to listen to, left click on the audio icon in your system tray (bottom right), and select any of your available speakers or headphones.
- After changing the output device on your OS, you'll need to click the "Refresh Audio Devices" button next to the dropdown menu in Synesthesia's audio settings in order to restart Desktop Audio with your newly selected device.

### **Windows Alternatives**

If for some reason you don't want to use the built-in "Desktop Audio" option, or are on an older version of Synesthesia that doesn't include Desktop Audio, there are still some great alternatives for Windows.

**Stereo Mix**

Windows has another built-in output as input option directly in its OS. All you have to do is enable and audio device called "Stereo Mix".

1. Right click on the audio icon in your system tray (bottom right), and select "Recording Devices".
2. Right click on a blank area in the box and make sure both "Show Disabled Devices" and "Show Disconnected Devices" options are checked. This should make a device called "Stereo Mix" appear.
3. Right click on "Stereo Mix" and click "Enable" to turn it on.
4. Click on the refresh icon next to the audio devices drop down menu in Synesthesia, and select "Stereo Mix" from the sources. If you still don't see it, try restarting Synesthesia.
5. Any music you output through your main audio output should now also be picked up by Synesthesia.

**VoiceMeeter Setup Guide**

With certain audio outputs, Stereo Mix won't be available or won't work. One option we recommend in this scenario is VoiceMeeter, a set of donationware programs from VB-Audio.

One advantage of using Voicemeeter instead of Stereo Mix is that the volume of the virtual input is independent of your hardware output volume. You can maintain full volume for Synesthesia's audio input signal while your speaker output is low or muted.

1. Download and install [VoiceMeeter](https://vb-audio.com/Voicemeeter/index.htm) from VB-Audio, following their installation instructions. You can also use Banana or Potato from VB-Audio, but for this guide we'll be using VoiceMeeter.
2. Follow VB-Audio's guide to [set VoiceMeeter as your default output device](https://voicemeeter.com/user-guide-startup-the-first-steps-replace-the-windows-mixer-with-voicemeeter/)
3. Open Synesthesia and go to the Settings tab, set your Audio Device to 'VoiceMeeter Output'.
4. Play some music and open an audio reactive scene to test. Check out the [VoiceMeeter User Manual](https://vb-audio.com/Voicemeeter/Voicemeeter_UserManual.pdf) to learn more.
