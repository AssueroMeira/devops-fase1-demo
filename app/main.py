from __future__ import annotations

import os

from flask import Flask, jsonify


def create_app() -> Flask:
    app = Flask(__name__)

    @app.get("/")
    def index():
        return jsonify(
            service="devops-fase1-demo",
            message="ok - deploy automatico",
            environment=os.getenv("APP_ENV", "local"),
        )

    @app.get("/health")
    def health():
        return jsonify(status="healthy")

    return app


app = create_app()


if __name__ == "__main__":
    # Local run: python app/main.py
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "5000")))
