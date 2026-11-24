#define MyAppName "ScreenSketcher"
#define MyAppVersion "0.0.2"
#define MyAppPublisher "J-E"
#define MyAppExeName "ScreenSketcher.exe"
#define MyAppIcon "..\src\ScreenSketcher\Resources\Icons\Icon.ico"
#define MyAppId "com.je.screensketcher"
; Output of: dotnet publish src/ScreenSketcher/ScreenSketcher.csproj -c Release -o publish
#define BuildDir "..\publish"

[Setup]
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=
OutputDir=..\setup_output
OutputBaseFilename=ScreenSketcher_Setup_{#MyAppVersion}
SetupIconFile={#MyAppIcon}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
PrivilegesRequiredOverridesAllowed=dialog

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; 
Name: "startup"; Description: "Start automatically at Windows startup"; GroupDescription: "Windows Startup";

[InstallDelete]
; Remove files left by older framework-dependent versions (0.0.2 and earlier)
Type: files; Name: "{app}\*.dll"
Type: files; Name: "{app}\ScreenSketcher.deps.json"
Type: files; Name: "{app}\ScreenSketcher.runtimeconfig.json"
Type: filesandordirs; Name: "{app}\Resources"

[Files]
; Self-contained single file, no other files needed
Source: "{#BuildDir}\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: startup; Check: not IsAdminInstallMode
Name: "{commonstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: startup; Check: IsAdminInstallMode

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent