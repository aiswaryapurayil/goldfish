/*
 * Copyright (C) 2023 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <android-base/unique_fd.h>
#include <qemud.h>

namespace goldfish {

using ::android::base::unique_fd;

class SensorsTransport {
 public:
    virtual int Send(const void* msg, int size) = 0;
    virtual int Receive(void* msg, int maxsize) = 0;
    virtual bool Ok() const = 0;
    virtual int Fd() const = 0;
    virtual const char* Name() const = 0;

    virtual ~SensorsTransport() = default;
};

class QemudSensorsTransport : public SensorsTransport {
 public:
    QemudSensorsTransport(const char* name);

    int Send(const void* msg, int size) override;
    int Receive(void* msg, int maxsize) override;
    bool Ok() const override;
    int Fd() const override;
    const char* Name() const override;

 private:
    const unique_fd m_qemuSensorsFd;
};

}  // namespace goldfish
