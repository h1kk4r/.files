defmodule Rune.UserConfig do
  use Rune.Config

  # This starter config uses the plain-text layout DSL. The renderer applies
  # semantic styles automatically:
  #
  # - "│ " follows exit-status coloring
  # - cwd gets cwd styling
  # - git.branch and git.dirty get git styling
  # - package/runtime/duration use their own semantic colors
  #
  # Available common fields in context:
  #
  # - cwd
  # - user_prefix
  # - git.branch
  # - git.dirty
  # - package
  # - runtime
  # - duration_badge
  #
  # Example:
  #   "│ " | cwd | " on "?git | git.branch | git.dirty
  #
  layout """
  top:
    "│ " | user_prefix | cwd | " on "?git | git.branch | git.dirty | " is "?package | package | " via "?runtime | runtime | " · "?duration_badge | duration_badge

  bottom:
    "│ "
  """

  palette do
    color :ok, "#7ee787"
    color :warn, "#f2cc60"
    color :err, "#ff7b72"
    color :git_branch, "#ff7b72"
  end

  element :git do
    style :clean, fg: :git_branch
    style :dirty, fg: :warn
    style :error, fg: :err
  end
end
