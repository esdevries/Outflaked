{ pkgs, profile, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles."dev" = {
      extensions =
        with pkgs.vscode-marketplace;
        [
          jnoortheen.nix-ide

          bradlc.vscode-tailwindcss
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode

          rust-lang.rust-analyzer

          shd101wyy.markdown-preview-enhanced
          yzane.markdown-pdf
          mathematic.vscode-pdf

          beardedbear.beardedtheme

          ms-python.python
          ms-python.vscode-pylance

          dart-code.dart-code
          dart-code.flutter
        ]
        ++ (with pkgs.vscode-extensions; [
          vadimcn.vscode-lldb
        ]);

      userSettings = {
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.quickSuggestions" = {
          "strings" = "on";
        };

        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorBlinking" = true;

        "files.trimTrailingWhitespace" = true;
        "files.insertFinalNewline" = true;

        "markdown-preview-enhanced.plantumlJarPath" =
          "/home/${profile.userName}/.local/share/plantuml/plantuml.jar";
        "markdown-preview-enhanced.breakOnSingleNewLine" = false;
        "[markdown]" = {
          "prettier.printWidth" = 80;
          "prettier.proseWrap" = "always";
        };

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "[python]" = {
          "editor.tabSize" = 4;
          "editor.insertSpaces" = true;
        };
        "python.languageServer" = "Pylance";
        "python.analysis.typeCheckingMode" = "strict";

        "rust-analyzer.check.command" = "clippy";
        "rust-analyzer.cargo.features" = "all";
        "rust-analyzer.procMacro.enable" = true;

        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        "eslint.validate" = [
          "javascript"
          "typescript"
          "javascriptreact"
          "typescriptreact"
        ];

        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };

        "css.validate" = false;
        "tailwindCSS.includeLanguages" = {
          plaintext = "html";
          typescript = "javascript";
          typescriptreact = "javascript";
        };

        "workbench.colorTheme" = "Bearded Theme feat. Mintshake D Raynh";
        "workbench.secondarySideBar.defaultVisibility" = "hidden";

        "[dart]" = {
          "editor.formatOnSave" = true;
          "editor.formatOnType" = true;
          "editor.selectionHighlight" = false;
          "editor.tabCompletion" = "onlySnippets";
          "editor.wordBasedSuggestions" = "off";
        };
      };
    };
  };

  home.file.".local/share/applications/code.desktop".text =
    builtins.replaceStrings
      [ "Exec=code" "Icon=vscode" ]
      [ "Exec=${pkgs.vscode}/bin/code" "Icon=${pkgs.vscode}/share/pixmaps/vscode.png" ]
      (builtins.readFile "${pkgs.vscode}/share/applications/code.desktop");
}
