require 'spec_helper'

describe App do

  context "when the supplied url contains '.herokuapp.com'" do
    let(:app) { App.new(url: "http://metapingertestcheck.herokuapp.com") }

    it "adds the Heroku app's project_name" do
      app
      expect(app.project_name).to eq("metapingertestcheck")
    end

    context "if the supplied url doesn't contain a protocol" do
      let(:app) { App.new(url: "metapingertestcheck.herokuapp.com") }

      it "adds the protocol" do
        expect(app.url).to eq("http://metapingertestcheck.herokuapp.com")
      end
    end

    describe "#exists?" do
      context "when a Heroku app exists at the given url" do
        it "returns true" do
          expect(app.exists?).to eq(true)
        end
      end

      context "when there is no Heroku app at the given url" do
        let(:app) { App.new(url: "slumberdunk07jkm25yeahhomie.herokuapp.com") }

        it "it returns false" do
          expect(app.exists?).to eq(false)
        end

        it "it adds a url_invalid error" do
          app.exists?
          expect(app.errors.messages[:url_invalid]).to_not eq(nil)
        end
      end
    end # describe #exists?
  end

  context "when the url doesn't contain 'herokuapp.com'" do
    let(:app) { App.new(url: "rottentomatoes.com") }

    it "doesn't persist" do
      expect(app.save).to eq(false)
    end

    context "on save" do
      it "adds a url_invalid error" do
        expect(app.errors.messages[:url_invalid]).to_not eq(nil)
      end
    end
  end
end
