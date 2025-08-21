# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev/reassembly/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "reassembly"; then

  new_window "code"
  select_window "code"
  run_cmd "cd reassembly"
  run_cmd "source python/.venv/bin/activate"
  run_cmd "nvim"

  new_window "py-term"
  select_window "py-term"
  run_cmd "cd reassembly/python"
  run_cmd "source .venv/bin/activate"

  new_window "cpp-term"
  select_window "cpp-term"
  run_cmd "cd reassembly/cpp"

  new_window "open3d-source"
  select_window "open3d-source"
  run_cmd "cd Open3D"
  run_cmd "nvim"

  new_window "data"
  select_window "data"
  run_cmd "cd data"
  run_cmd "nvim"

  new_window "reassembly-basic"
  select_window "reassembly-basic"
  run_cmd "cd reassembly/python"
  run_cmd "source .venv/bin/activate"
  run_cmd "cd ../../reassembly-basic"
  run_cmd "nvim"

  new_window "reassembly-basic-term"
  select_window "reassembly-basic-term"
  run_cmd "cd reassembly/python"
  run_cmd "source .venv/bin/activate"
  run_cmd "cd ../../reassembly-basic"

  select_window "code"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
