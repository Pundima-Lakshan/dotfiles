# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/veritas-bank-microservices/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "veritas"; then

  new_window "nvim"
  select_window "nvim"
  run_cmd "nvim"

  new_window "term"
  select_window "term"

  new_window "reference"
  select_window "reference"
  run_cmd "cd ../royal-reserve-bank"
  run_cmd "nvim"

  select_window "nvim"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
