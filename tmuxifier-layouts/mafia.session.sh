# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/mafia"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "mafia"; then

  new_window "client-edit"
  select_window "client-edit"
  run_cmd "cd client"
  run_cmd "nvim"

  new_window "client-term"
  select_window "client-term"
  run_cmd "cd client"

  new_window "server-edit"
  select_window "server-edit"
  run_cmd "cd server"
  run_cmd "nvim"

  new_window "server-term"
  select_window "server-term"
  run_cmd "cd server"

  select_window "client-edit"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
