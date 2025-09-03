# Custom Block Mod Setup Instructions

## Prerequisites
- Java 21 or later
- An IDE (IntelliJ IDEA recommended)

## Setup Steps

1. **Clone/Download this project** to your desired location

2. **Import the project** into your IDE:
   - For IntelliJ IDEA: Open the `build.gradle` file and import as a Gradle project

3. **Build the project**:
   ```bash
   ./gradlew build
   ```

4. **Run the mod in development**:
   ```bash
   # For client (with GUI)
   ./gradlew runClient
   
   # For server (headless)
   ./gradlew runServer
   ```

## What the mod does

This mod adds a **Custom Block** with the following features:

- **Crafting Recipe**: Surround a diamond with 8 stone blocks
- **Special Behavior**: When right-clicked, it plays a bell sound and shows a message
- **Properties**: Diamond-colored, metal sound, requires correct tool for drops

## File Structure

```
src/main/java/com/yourname/customblock/
├── CustomBlockMod.java     # Main mod class
├── CustomBlock.java        # Block behavior implementation
├── ModBlocks.java          # Block registration
└── ModItems.java          # Item registration

src/main/resources/
├── META-INF/neoforge.mods.toml        # Mod metadata
├── assets/customblock/                # Client-side assets
│   ├── blockstates/custom_block.json  # Block state definition
│   ├── models/block/custom_block.json # Block model
│   └── models/item/custom_block.json  # Item model
└── data/customblock/
    └── recipes/custom_block.json      # Crafting recipe
```

## Adding Your Own Texture

1. Create a 16x16 pixel PNG texture
2. Place it at: `src/main/resources/assets/customblock/textures/block/custom_block.png`
3. Rebuild and run the mod

## Customizing the Block

To modify the block behavior, edit `CustomBlock.java`:

- `useItemOn()`: Handles right-click interactions
- Change the constructor properties in `ModBlocks.java` for different hardness, sounds, etc.

## Next Steps

- Add more complex behaviors (tile entities, GUIs)
- Create multiple blocks
- Add custom items
- Implement world generation features