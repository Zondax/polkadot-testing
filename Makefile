docs:
	@docker run --platform linux/amd64 \
		--rm --volume "$$(pwd)/docs:/data" --user $(id -u):$(id -g) \
		pandoc/extra report.md -o report.pdf \
		--template eisvogel \
		--listings --filter pandoc-latex-environment

.PHONY: docs

