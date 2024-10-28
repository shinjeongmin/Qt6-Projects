#include "FileIO.h"

FileIO::FileIO(QObject *parent)
{

}

// 파일 열기 함수
QString FileIO::read(const QString filename)
{
    QString filePath = filename;
    if(filePath.startsWith("file:///")){
        filePath.remove(0,QString::fromStdString("file:///").size());
    }

    QFile file(filePath);
    if(!file.exists()){
        return "";
    }
    file.open(QFile::ReadOnly | QFile::Text);

    QTextStream stream(&file);
    QString readText = stream.readAll();
    file.close(); // open - close 한 쌍!

    return readText;
}

// 파일 저장 함수
void FileIO::write(QString filename, QString input)
{
    QString filePath = filename;
    if(filePath.startsWith("file:///")){
        filePath.remove(0, QString::fromStdString("file:///").size());
    }

    QFile file(filePath);
    file.open(QFile::WriteOnly | QFile::Text);

    QTextStream stream(&file);
    stream << input;

    file.flush();
    file.close();
}
