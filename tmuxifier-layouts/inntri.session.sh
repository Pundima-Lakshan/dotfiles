# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/inntri-ui/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "inntri"; then

  new_window "nvim"
  select_window "nvim"
  run_cmd "nvim"

  new_window "term"
  split_h 50
  run_cmd "cd packages/apps/shipment" 2

  select_window "nvim"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
