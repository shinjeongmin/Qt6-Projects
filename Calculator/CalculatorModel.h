#ifndef CALCULATORMODEL_H
#define CALCULATORMODEL_H

#include <QObject>
#include <QQmlEngine>

class CalculatorModel : public QObject
{
    Q_OBJECT // QObject 계열 클래스로 qml에서 접근하고 사용됨
    QML_ELEMENT // QML에 선언해서 사용할 수 있게 됨

public:
    enum CalMode{
        None = 0,
        Plus,
        Minus,
        Multiply,
        Divide
    };
    Q_ENUM (CalMode) // enum을 qml에 노출

    explicit CalculatorModel(QObject *parent = nullptr);
    Q_PROPERTY(double result READ result WRITE setResult NOTIFY resultChanged)
    Q_PROPERTY(int calMode READ calMode WRITE setCalMode NOTIFY calModeChanged)

    Q_INVOKABLE void calculate(double num);

    double result() const;
    void setResult(double newResult);
    int calMode() const;
    void setCalMode(int newCalMode);

signals:
    void resultChanged();
    void calModeChanged();

private:
    double m_result = 0.0;
    int m_calMode;
};

#endif // CALCULATORMODEL_H
