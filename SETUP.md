# Custom Block Mod Setup Instructions

## Prerequisites
- **Java 21** (required for NeoForge 1.21.1)
- An IDE (IntelliJ IDEA recommended)

## Installing Java 21 on Windows

If you get the error "Unsupported class file major version 65", you need Java 21:

### Method 1: Download from Oracle
1. Go to https://www.oracle.com/java/technologies/downloads/#java21
2. Download "Windows x64 Installer"
3. Run the installer and follow instructions
4. Restart Command Prompt/PowerShell after installation

### Method 2: Using Chocolatey (if installed)
```cmd
choco install openjdk21
```

### Method 3: Using Windows Package Manager
```cmd
winget install Microsoft.OpenJDK.21
```

### Verify Installation
Open Command Prompt and run:
```cmd
java -version
```
Should show version 21.x.x

## Troubleshooting "Unsupported class file major version 65"

If you have Java 21 installed but still get this error:

### 1. Check JAVA_HOME Environment Variable
```cmd
echo %JAVA_HOME%
```

### 2. Find Java 21 Installation Path
```cmd
where java
```

### 3. Set JAVA_HOME (if needed)
**Method A: Through System Settings**
1. Press `Win + R`, type `sysdm.cpl`, press Enter
2. Click "Environment Variables"
3. Under "System Variables", click "New"
4. Variable name: `JAVA_HOME`
5. Variable value: Path to your Java 21 installation (e.g., `C:\Program Files\OpenJDK\openjdk-21.0.8`)
6. Click OK and restart Command Prompt

**Method B: Command Line (temporary)**
```cmd
set JAVA_HOME=C:\Program Files\OpenJDK\openjdk-21.0.8
```

### 4. Alternative: Use Full Path
Instead of `gradlew.bat build`, try:
```cmd
"C:\Program Files\OpenJDK\openjdk-21.0.8\bin\java" -version
gradlew.bat build
```

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