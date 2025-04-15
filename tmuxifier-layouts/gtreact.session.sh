# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/gtfleet-all/gtfleet-react-csharp/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "gtreact"; then

  new_window "client-edit"
  select_window "client-edit"
  run_cmd "cd gtfleet.client"
  run_cmd "nvim"

  new_window "client-term"
  select_window "client-term"
  run_cmd "cd gtfleet.client"

  new_window "server-edit"
  select_window "server-edit"
  run_cmd "cd gtfleet.Server"
  run_cmd "nvim"

  new_window "server-term"
  select_window "server-term"
  run_cmd "cd gtfleet.Server"

  select_window "client-edit"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
