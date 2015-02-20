require "open3"
require "tempfile"

module Typescript::Rails::Executor
  class << self
    def tsc_path
      return "tsc"
    end

    def compile_file(source_path, *tsc_options)
      output_f = Tempfile.new(['ts_out', '.js'])

      # execute 'tsc'
      cmd = [tsc_path, *tsc_options, '--out', output_f.path, source_path]
      exit_status, logs = Open3.popen2e(*cmd) do |stdin, stdout_err, th|
          stdin.close
          [th.value, stdout_err.read]
      end

      output_js = File.exists?(output_f.path) ? File.read(output_f.path) : nil
      return {
        result_code: output_js,
        status_code: exit_status,
        logs: logs,
      }

    ensure
      output_f.close! unless output_f.nil?
    end

    def compile(source_code, *tsc_options)
      path = Tempfile.open(['rails-typescript', '.js.ts']) do |f|
        f.write(source_code)
        f.path
      end

      result = compile_file(path, *tsc_options)
      if result[:status_code] == 0
        result[:result_code]
      else
        raise result[:logs]
      end
    end
  end
end
