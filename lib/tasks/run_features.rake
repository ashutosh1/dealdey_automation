namespace :parallel do
  desc "Runs cucumber suite on cross-browser"
  task :cucumber do
    browsers = YAML.load_file(File.expand_path(File.join("config/data", "browsers.yml")))
    browsers['browser']['list'].each do |browser|
      system("thor set:browser --values=browser:'#{browser}'")
      pid = fork { exec("parallel_cucumber features") }
      Process.detach(pid)
      sleep 5
    end
  end
end

