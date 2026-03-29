from app.main import create_app


def test_health_returns_healthy():
    app = create_app()
    client = app.test_client()

    resp = client.get('/health')
    assert resp.status_code == 200
    assert resp.get_json() == {'status': 'healthy'}


def test_root_has_metadata():
    app = create_app()
    client = app.test_client()

    resp = client.get('/')
    assert resp.status_code == 200
    data = resp.get_json()
    assert data['service'] == 'devops-fase1-demo'
    assert data['message'] == 'ok - deploy automatico'
    assert 'environment' in data
