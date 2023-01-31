# MIDI and OSC FAQ

### Can you use MIDI Devices in Synesthesia?
Yes — MIDI can be used to control all of these features:

- Scene controls
- Meta controls
- Control actions (random and default)
- Launch media
- Launch scenes
- Control playlists
- Trigger preset favslots

MIDI Mapping works very similarly to how it does in DAWs or other MIDI enabled programs. However, there are some subtleties to the MIDI system in Synesthesia that will be discussed below.

#### **How Controls Behave**

- Toggle or Bang controls will behave intuitively for Note On/Off messages, turning on with a Note On message or off with a Note Off (Bang type ignores Note Off entirely).
- With CC messages, you'll see the threshold box enabled in the MIDI mapping list in the MIDI tab. CC values above the threshold will act as turning the control "on" while any MIDI CC values below the threshold will turn it "off".
- Dropdown controls will work by cycling through the options. A CC value of 0 would select the first option, while 127 would select the final option.
- Slider, Knob, and XY type controls all behave similarly, except that an XY is essentially just two sliders mapped individually, one for each axis.
- For these controls, CC messages will set the slider to the value expected, CC value of 127 will result in 100%, 0 will result in 0%.
- You can also set your own min and max range, to make 0 and 127 CC values correspond to any slider value. (ex: 0.2 to bottom out at 20%).
- If Note-type messages are mapped to Slider, Knob, or XY sliders, Note On will set them to 100%, while Note Off will set them to 0%. You can use the "min" and "max" settings to change this upper and lower bound behavior.

#### **Overwrite Old Mappings Mode**

There are two modes for MIDI mapping, determined by the toggle "Overwrite Old Mappings (per scene)" in the top right of the MIDI tab. 

- When this toggle is on, a new mapping for a MIDI message will overwrite any previous mappings for that message *for that scene.* It will not overwrite mapping for other scenes.
- When this toggle is off, new mappings will not overwrite old ones. You can map multiple controls to the same MIDI control, allowing more advanced usage.

This toggle is on by default, which **ensures that you never have two controls responding to one MIDI message.** In general, keeping this on is more intuitive, because you don't have to go hunt down old mappings to delete them.

#### **Midi Panel**

All MIDI mapping happens through the MIDI panel. You'll see 7 tabs available at the top:

1. scene specific
2. global
3. meta controls
4. media
5. favslots
6. start scenes
7. devices

*Scene Specific*

Mappings in this tab are specific to a single scene. This is useful when you want a special mapping for a certain scene, or, if you want a different mapping for every scene. Scene Specific mappings will take precedence over Global controls. While "Overwrite Old Mappings (per scene)" is on, any new mappings here will overwrite any Meta Controls you've mapped **but won't overwrite Global controls.**

*Global*

Since different scenes have different controls and different layouts, the global tab allows you to set a global mapping that will apply to every scene by default. The way the global tab indexes controls is from left to right. When you go to the global tab, the MIDI_MAPPING scene will start, which has 8 copies of every control (generally, more than any other scene will have). So, if you map TOGGLE_1 and TOGGLE_2 to the first two buttons on your MIDI device, you will be able to use those same two buttons to control the first and second toggles that appear in any scene's controls (from left to right). The same goes for the other control types — Slider, Knob, Bang, XY, etc.

*Meta Controls*

Meta control mappings will also apply to all scenes. You can only have one Meta controls mapping at any time. If "Overwrite Old Mappings" mode is on, then mappings must be unique between Meta Controls and Scene Specific or Global.

*Launching Media/Favslots/Scenes*

Mappings for media, favslots, and scenes all work in the same way — they are "events" that occur whenever the MIDI value crosses a threshold. If you are mapping these features with a CC value, be sure to leave the "threshold" at a reasonable value to avoid frequent re-triggering.

In the scenes section, you can also map playlist controls for previous, next, and play. This can be very useful to manage your set during a live show.

*Devices*

Go to the devices tab first and hit "refresh connected devices" to search for new devices. In this tab you can delete all MIDI mappings, or delete all MIDI mappings for a certain device only. If your computer loses connection with a MIDI device, you'll need to come here and "refresh connected devices" to reestablish the connection. Once you see your device listed and shown as "connected", you're ready to map the device.

---

### What is the best way to use MIDI?
For the most intuitive approach, leave the "Overwrite Old Mappings" setting on. You can start by creating a sensible "global" mapping. Then you can map the meta controls, usually setting aside 3 or 4 sliders or knobs just for those. For example, I usually won't map all the meta controls, only the ones I know I'll need during a show. At this point you can open any scene and control it via MIDI.

Usually there are certain scenes where you will want a special control scheme, something more intuitive just for that scene. For that you can go the scene specific tab and run the scene you want to map using the playlist on the right. Then remap any of the sliders or pads you used to map the global controls, (be careful not to overwrite your meta control mappings!). The scene specific controls will take precedence over the global controls but won't overwrite them — both will be saved.

---

### Does Synesthesia support OSC Input & Output?
Yes, Synesthesia Pro has OSC input and output available. Currently, OSC input extends to controls (both scene & meta) and scenes. OSC output exposes the Synesthesia Audio Engine, allowing you to bring the same powerful audio reactivity into other software. See our [documentation on OSC](../manual/osc.md)

---

### How can I change Synesthesia's OSC output addresses?

The addresses that Synesthesia uses to output data are currently fixed. If you'd like to change them to target a different address in another app, you'll need to use intermediate software to rename the address. Some good choices here would be Max/MSP, TouchDesigner, TWO, or Chataigne. 