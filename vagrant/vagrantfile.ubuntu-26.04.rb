=begin
Vagrant Ubuntu 24.04
=end

def vagrant_define_vm(vagrant, configx)

    configx.vm.define "ubuntu-24.04", autostart: false do |config|

        # defintion
        config.vm.box = "bento/ubuntu-24.04"

        config.vm.hostname = "vagrant"

        config.vm.disk :disk,
            size: "64GB",
            primary: true

        config.vm.network :forward_port,
            id: "ssh",
            guest: 22,
            host: 10022,
            auto_correct: true

        config.vm.provider :virtualbox do |vbox|
            vbox.memory = 4096
            vbox.cpus = 2
        end

        # environment
        env = {
            "DEBUG_FRONTENT" => "interactive",
            "TZ" => "Etc/UTC",
        }

        # shares
        config.vm.synced_folder "~/workspace", "/host/workspace"

        # provision - vagrant info
        config.vm.provision "shell",
            path: "provision/extra/vagrant_info.sh",
            env: {
                "VAGRANT_VM" => "dev",
                "VAGRANT_BOX" => "ubuntu-24.04",
                "VAGRANT_BOX_OWNER" => "bento",
                "VAGRANT_OS" => "ubuntu",
                "VAGRANT_OS_VERSION" => "24.04",
                "VAGRANT_OS_VERSION_CODENAME" => "noble",
            }

        # provision - system
        # <noop>

        # provision - tools
        config.vm.provision "shell", env: env, path: "provision/os/ubuntu/24.04/shell.install.sh"
        config.vm.provision "shell", env: env, path: "provision/os/ubuntu/24.04/tools.install.sh"
        config.vm.provision "shell", env: env, path: "provision/os/ubuntu/24.04/editor.install.sh"
        config.vm.provision "shell", privileged: false, env: env, path: "provision/os/ubuntu/24.04/shell.sh"
        config.vm.provision "shell", privileged: false, env: env, path: "provision/os/ubuntu/24.04/tools.sh"
        config.vm.provision "shell", privileged: false, env: env, path: "provision/os/ubuntu/24.04/editor.sh"

        # provision - dev
        # <noop>

        # provision - configs
        config.vm.provision "file", source: "provision/configs/home/fish_lambda.fish_prompt.fish", destination: "~/.config/fish/functions/fish_prompt.fish"
        config.vm.provision "file", source: "provision/configs/home/fish_lambda.fish_right_prompt.fish", destination: "~/.config/fish/functions/fish_right_prompt.fish"
        config.vm.provision "file", source: "provision/configs/home/.bashrc", destination: "~/.bashrc"
        config.vm.provision "file", source: "provision/configs/home/.tmux.conf", destination: "~/.tmux.conf"
        config.vm.provision "file", source: "provision/configs/home/.vimrc", destination: "~/.vimrc"
        config.vm.provision "file", source: "provision/configs/home/nvim", destination: "~/.config/nvim"

        # provision - identity
        config.vm.provision "file", source: "~/.gitignore", destination: "~/.gitignore"
        config.vm.provision "file", source: "~/.netrc", destination: "~/.netrc"

    end

end
