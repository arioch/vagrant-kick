module Vagrant
  module Command
    class KickCommand < NamedBase
      register "kick", "Run a number of predefined tests"

      def execute
        target_vms.each do |vm|
          if vm.created?
            if !vm.vm.accessible?
              raise Errors::VMInaccessible
            elsif vm.vm.running?
              puts
              # refactor in progress
              puts "[#{vm.name}] REMOTE"
              File.open("tests/#{vm.name}.ssh", "r").each do |infile|
                commands = infile

                vm.ssh.execute do |ssh|
                  ssh.sudo!(commands) do |channel, type, data|
                    puts
                    ssh.check_exit_status(data, commands) if type == :exit_status
                    vm.env.ui.info(infile) if type != :exit_status
                    vm.env.ui.info(data) if type != :exit_status
                    #vm.env.ui.info("") if type != :exit_status
                  end
                end
              end
              
              puts
              system "./tests/#{vm.name}.local"
              
              puts "[#{vm.name}] LOCAL"
              File.open("tests/#{vm.name}.local", "r").each do |infile|
                puts "[#{vm.name}] #{infile}"
                system "#{infile}"
              end

            else
              vm.env.ui.info I18n.t("vagrant.commands.common.vm_not_running")
            end
          else
            vm.env.ui.info I18n.t("vagrant.commands.common.vm_not_created")
          end
        end
      end
    end
  end
end

# TODO:
# - catch exit status for each test
