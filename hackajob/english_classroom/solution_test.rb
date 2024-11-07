describe "Solution" do
	##
	# First Example
	##
	##
	describe ".exampleMethod" do
		context "given an example string" do
			it "return example string" do
				expect("this is an example").to eql("this is an example")
			end
		end
	end

	##
	# Second Example
	##
	##
	let(:run) { Solution.new.run(morse, input) }

	describe ".run" do
		context "for morse to English" do
			let(:morse) { true }

			let(:input) do
				"- .... .   .-- .. --.. .- .-. -..   --.- ..- .. -.-. -.- .-.. -.--   .--- .. -. -..- . -..   - .... .   --. -. --- -- . ...   -... . ..-. --- .-. .   - .... . -.--   ...- .- .--. --- .-. .. --.. . -.. .-.-.-"
			end

			let(:output) do
				"the wizard quickly jinxed the gnomes before they vaporized."
			end

			it "return expected output" do
				expect(run).to eql(output)
			end
		end

		context "for English to morse" do
			let(:morse) { false }

			let(:input) do
				"the wizard quickly jinxed the gnomes before they vaporized."
			end

			let(:output) do
				"- .... .   .-- .. --.. .- .-. -..   --.- ..- .. -.-. -.- .-.. -.--   .--- .. -. -..- . -..   - .... .   --. -. --- -- . ...   -... . ..-. --- .-. .   - .... . -.--   ...- .- .--. --- .-. .. --.. . -.. .-.-.-"
			end

			it "return expected output" do
				expect(run).to eql(output)
			end
		end
	end
end
