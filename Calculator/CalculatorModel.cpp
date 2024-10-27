#include "CalculatorModel.h"

CalculatorModel::CalculatorModel(QObject *parent)
    : QObject{parent}
{

}

void CalculatorModel::calculate(double num)
{
    switch(m_calMode) {
    case Plus:
        m_result += num;
        break;
    case Minus:
        m_result -= num;
        break;
    case Multiply:
        m_result *= num;
        break;
    case Divide:
        m_result /= num;
        break;
    default:
        m_result = num;
        break;
    }

    emit resultChanged(); // Model -> View로 result가 갱신됨을 알림
}

double CalculatorModel::result() const
{
    return m_result;
}

void CalculatorModel::setResult(double newResult)
{
    if (qFuzzyCompare(m_result, newResult))
        return;
    m_result = newResult;
    emit resultChanged();
}

int CalculatorModel::calMode() const
{
    return m_calMode;
}

void CalculatorModel::setCalMode(int newCalMode)
{
    if (m_calMode == newCalMode)
        return;
    m_calMode = newCalMode;
    emit calModeChanged();
}
