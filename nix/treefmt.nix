{inputs, ...}: {
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  perSystem = {
    config,
    self',
    ...
  }: {
    treefmt.config = {
      inherit (config.flake-root) projectRootFile;
      flakeCheck = true;
      flakeFormatter = true;

      package = self'.packages.default;

      programs = {
        alejandra.enable = true;
        deadnix.enable = true;
        gofumpt.enable = true;
        prettier.enable = true;
        statix.enable = true;
      };

      settings.formatter = {
        deadnix = {
          pipeline = "nix";
          priority = 1;
        };

        statix = {
          pipeline = "nix";
          priority = 2;
        };

        alejandra = {
          pipeline = "nix";
          priority = 3;
        };

        prettier = {
          options = ["--tab-width" "4"];
          includes = [
            "*.css"
            "*.html"
            "*.js"
            "*.json"
            "*.jsx"
            "*.md"
            "*.mdx"
            "*.scss"
            "*.ts"
            "*.yaml"
          ];
        };
      };
    };

    devshells.default = {
      commands = [
        {
          category = "formatting";
          name = "fmt";
          help = "format the repo";
          command = "nix fmt";
        }
      ];
    };
  };
}
