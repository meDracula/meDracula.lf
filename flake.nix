{
	description = "LF configuration for meDracula as a plugin";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
	};
	outputs = { self, nixpkgs }:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
	in
	{
		devShells.${system} = {
			lf = pkgs.mkShell {
				name = "lf";
				packages = [
					pkgs.figlet
					pkgs.lf
				];
				shellHook = ''echo "LF" | figlet'';
			};
		};
	};
}
