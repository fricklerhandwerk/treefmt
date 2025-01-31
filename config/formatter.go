package config

type Formatter struct {
	// Command is the command to invoke when applying this Formatter.
	Command string
	// Options are an optional list of args to be passed to Command.
	Options []string
	// Includes is a list of glob patterns used to determine whether this Formatter should be applied against a path.
	Includes []string
	// Excludes is an optional list of glob patterns used to exclude certain files from this Formatter.
	Excludes []string
	// Indicates this formatter should be executed as part of a group of formatters all sharing the same pipeline key.
	Pipeline string
	// Indicates the order of precedence when executing as part of a pipeline.
	Priority int
}
