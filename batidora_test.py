from Batidora import Batidora
import pytest

@pytest.mark.parametrize("parametro1, resultado_esperado", [
    (1800,15000),
    (2000, 15000),
    (2500,15000),
    (1500,15000)
    
])

def test_mezclar(parametro1, resultado_esperado):
    batidora = Batidora(parametro1)
    batidora.encender()
    assert batidora.mezclar(parametro1) == resultado_esperado
    
@pytest.mark.parametrize("minutos, resultado_esperado",[
    (60,1.0),
    (120,2.0),
    (30, 0.5)
])

def test_calcular_consumo(minutos,resultado_esperado):
    batidora = Batidora(1000)
    if minutos <= 0:
        raise ValueError("No se puede calcular el consumo si el tiempo de uso es menor o igual a 0")
    else:
        assert batidora.calcular_consumo(minutos) == resultado_esperado
        
def test_mezclar_sin_encender():
    batidora = Batidora(2000)
    with pytest.raises(ValueError, match="La batidora está apagada"):
        batidora.mezclar(2000)
        
def test_detener_batidora():
    batidora = Batidora(2000)
    batidora.encender()
    batidora.mezclar(2000)
    assert batidora.detener_batidora() == 0  # La velocidad debe ser 0 después de detenerse
    assert batidora.encendida == False 