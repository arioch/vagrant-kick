require 'vagrant'

module Vagrant
  module Command
    class FoobarCommand < NamedBase
      register "foobar", "Run a number of predefined tests"

      def execute
        target_vms.each do |vm|
          if vm.created?
            if !vm.vm.accessible?
              raise Errors::VMInaccessible
            elsif vm.vm.running?
              puts
              puts vm.name
              Dir.glob("tests/#{vm.name}.*") do |file|
                puts
                system "./#{file}"
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
